#!/usr/bin/env python3
"""
Free Web Search Tool using DuckDuckGo
No API key required - completely free
"""

import sys
import json
import requests
from bs4 import BeautifulSoup
from urllib.parse import quote_plus

def search_duckduckgo(query, num_results=5):
    """
    Search DuckDuckGo and return results
    No API key needed - uses HTML parsing
    """
    try:
        # DuckDuckGo HTML search
        url = f"https://html.duckduckgo.com/html/?q={quote_plus(query)}"

        headers = {
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'
        }

        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()

        soup = BeautifulSoup(response.text, 'html.parser')
        results = []

        # Parse search results
        for result in soup.find_all('div', class_='result', limit=num_results):
            title_elem = result.find('a', class_='result__a')
            snippet_elem = result.find('a', class_='result__snippet')

            if title_elem:
                title = title_elem.get_text(strip=True)
                url = title_elem.get('href', '')
                snippet = snippet_elem.get_text(strip=True) if snippet_elem else ""

                results.append({
                    'title': title,
                    'url': url,
                    'snippet': snippet
                })

        return {
            'success': True,
            'query': query,
            'results': results,
            'count': len(results)
        }

    except Exception as e:
        return {
            'success': False,
            'error': str(e),
            'query': query
        }

def main():
    if len(sys.argv) < 2:
        print(json.dumps({
            'success': False,
            'error': 'Usage: free_web_search.py <search query>'
        }))
        sys.exit(1)

    query = ' '.join(sys.argv[1:])
    result = search_duckduckgo(query)
    print(json.dumps(result, indent=2))

if __name__ == '__main__':
    main()
