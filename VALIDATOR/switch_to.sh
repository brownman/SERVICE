 
#name=${1:-mindmap}
name=atlassian
#url=${2:-'http://drichard.org/mindmaps/#'}
#url='https://linnovate.atlassian.net/secure/RapidBoard.jspa?rapidView=3&projectKey=TRAV&view=planning&selectedIssue=TRAV-102&quickFilter=5'
url="https://linnovate.atlassian.net/secure/RapidBoard.jspa?rapidView=3&quickFilter=5"
commander switch_to $name "'$url'"
