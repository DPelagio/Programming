    
#Daniel Pelagio
#Luis Carrasco
#Code to connect to a database at port bolt://localhost:7687 and queue a query
#compile and run with python3 <filename.py>
from neo4j import GraphDatabase #pip3 install neo4j

uri = "bolt://localhost:7687"
driver = GraphDatabase.driver(uri, auth=None)

def print_num_hyperlinks(tx, limit):
    for record in tx.run("MATCH (n)-[r:HYPERLINKS_TO]->() "
    					 "with n, count(r) as num_hyperlinks "
                         "WHERE n.nodeID = {limit} "
                         "RETURN n, num_hyperlinks", limit=limit):
        print(record[""])

with driver.session() as session:
    session.read_transaction(print_num_hyperlinks, "0")
    session.read_transaction(print_num_hyperlinks, "5")


