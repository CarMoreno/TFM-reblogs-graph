# Reblogs Mastodon Graph

<a href="https://doi.org/10.5281/zenodo.17781317"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.17781317.svg"/></a>

![reblog_graph](reblogs_fragmento.png)

## How to run this project:

If you want to run this project just follow the next steps. I assume you have Docker installed in your system.

1. Clone the repo: `git clone git@github.com:CarMoreno/TFM-reblogs-graph.git`.
2. Go to the local folder: `cd /path/to/TFM-reblogs-graph`.
3. Install the dependencies: `uv sync`.
4. Download the `authors.csv` and `rebloggers.csv` datasets from [Zenodo](https://doi.org/10.5281/zenodo.17781446).
5. Copy the above files in the `data` folder (folder lives in this repo).
6. Start the local Neo4J database: `echo "NEO4J_PASSWORD=my_password" > .env && docker compose up`
7. Go to the graph-analysis jupyter notebook to create the `nodes.csv` and `relationships.csv` files, then you can create the graph into Neo4J using `create_nodes_db` and `create_relationships_db` functions.
