from crawler.author import main as main_author
from crawler.rebloggers import main as main_rebloggers


def get_authors():
    main_author()


def get_rebloggers():
    main_rebloggers()


if __name__ == "__main__":
    # get_authors()
    get_rebloggers()
