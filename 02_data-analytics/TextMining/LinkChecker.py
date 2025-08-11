
import requests
from bs4 import BeautifulSoup
import markdown

def get_link_status(link):
    response = requests.head(link)
    return (link, response.status_code)

def extract_http_links(urls):
    link_status_dict = {}
    for url in urls:
        response = requests.get(url)
        soup = BeautifulSoup(response.text, 'html.parser')
        links = [a['href'] for a in soup.find_all('a', href=True) if a['href'].startswith('http')]
        link_status_dict[url] = [get_link_status(link) for link in links]
    return link_status_dict
#file_path beachten im Mac die Datei "link.md" ist im home/user zu finden
#Wenn kein bestimmter Dateipfad angegeben wird, wird die Datei 'links.md' im selben Verzeichnis wie das Python-Skript gespeichert.
def save_links_to_markdown(urls, file_path):
    link_status_dict = extract_http_links(urls)
    markdown_text = "| URL | Link | Status |\n| --- | --- | --- |\n"
    for url, links in link_status_dict.items():
        for link, status_code in links:
            markdown_text += f"| {url} | [{link}]({link}) | {status_code} |\n"
    with open(file_path, 'w') as f:
        f.write(markdown_text)

urls = ['desired Link',
        'desired Link']
save_links_to_markdown(urls, 'links.md')
