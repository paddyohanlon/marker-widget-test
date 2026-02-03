#!/bin/bash

echo "Select environment:"
echo "1) staging"
echo "2) staging2"
echo "3) production"
read -p "Enter choice [1-3]: " choice

case $choice in
    1)
        url="https://marker-widget-test.netlify.app/staging.html"
        ;;
    2)
        url="https://marker-widget-test.netlify.app/staging2.html"
        ;;
    3)
        url="https://marker-widget-test.netlify.app/production.html"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

# Open URL in default browser (works on Linux, macOS, and WSL)
if command -v xdg-open &> /dev/null; then
    xdg-open "$url"
elif command -v open &> /dev/null; then
    open "$url"
elif command -v wslview &> /dev/null; then
    wslview "$url"
else
    echo "Could not detect browser opener. URL: $url"
    exit 1
fi