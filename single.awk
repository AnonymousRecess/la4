# @AUTHOR: Jeff Kahn
# @DATE: 11/30/2020

BEGIN {
FPAT = "([^,]*)|(\"[^\"]+\")" # Seperate fields by comma

# Beginning HTML code with redirect to file
print "<html>\n" > "singles.html" 
print "<head>" > "singles.html"
print"<title> Single Dwellings Data </title>" > "singles.html"
print "</head>" > "singles.html"
print "<body>" > "singles.html"
print "<h1> Single Dwellings </h1>" > "singles.html"
print "<table>" > "singles.html"
}

/IssueDate/ {print $1 "\t" $5 "\t" $6 "\t" $7 "\t" $8 > "singles.html"} 
tolower($3) ~ /single family dwelling/ {  # REGEX to case-insensitive match for single family dwelling
    print "<tr><td>" $1 "</td>"  "<td>" $5 "</td>"  "<td>" $6 "</td>" "<td>" $7 "</td>" "<td>" $8 "</td>" "</tr>" > "singles.html" # Only care about certain fields
    }
    


END { # End by closing tags
    print "</tr>" > "singles.html"
    print "</table> \n" > "singles.html"
    print "</body>" > "singles.html"
    print "</html>" > "singles.html"
}