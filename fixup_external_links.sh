#!/bin/bash

for FILE in html/*.html
do
    echo $FILE
    sed -i 's%<body>%\
<body>\
    <div class="user_header">\
         <a href="https://hursts.org.uk">All Documents</a> |\
         <a href="../notes.pdf">PDF version</a>\
    </div><hr />%g' $FILE
done
