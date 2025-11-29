// CRETAE projection
CALL gds.graph.drop('reblogger-network')
CALL gds.graph.project('reblogger-network', 'Instance', {
  REBLOGS: {properties: 'weight'}
})

//WCC
CALL gds.wcc.write('reblogger-network', {writeProperty:'rebloggerWcc'})
YIELD componentCount, componentDistribution


// Get the sub-graph with more nodes.

MATCH p=(i:Instance)-[:REBLOGS]->()
WHERE i.rebloggerWcc = 8
RETURN p
LIMIT 250

// Count the top 5 components with more number of nodes.

MATCH (i:Instance)
WITH i.rebloggerWcc AS componentId, count(*) AS countOfMembers
ORDER BY countOfMembers DESC
RETURN componentId, countOfMembers
LIMIT 5

// Get more-nodes subgraph density
// Llama a dos subconsultas para obtener los conteos CORRECTOS
CALL {
    // Cuenta todos los nodos que pertenecen al componente 8
    MATCH (n:User)
    WHERE n.rebloggerWcc = 8
    RETURN count(n) AS nodeCount
}
CALL {
    // Cuenta todas las relaciones ENTRE nodos que pertenecen al componente 8
    MATCH (n1:User)-[r:REBLOGS]->(n2:User)
    WHERE n1.rebloggerWcc = 8 AND n2.rebloggerWcc = 8
    RETURN count(r) AS relCount
}
WITH toFloat(nodeCount) AS N, toFloat(relCount) AS E
WHERE N > 1
RETURN E / (N * (N - 1)) AS density