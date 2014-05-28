== Overview

The goal of this project is to make a request at this URL and have it show a completed proposal:
http://localhost:3000/proposal_viewer/show/1

Once the user accesses the above URL an HTML template found in the public directory will be retrieved and populated with data from several models. For the purposes of this example, assume that the HTML template is user generated and stored in this public directory.  

This means that the HTML file must be left exactly as is and cannot be modified or have <%=%> tags within.

Important: 

1. You cannot add any files to the folder containing the index.html
2. You cannot modify any of the files in the folder containing the index.html
3. Good quality code is more important than speed, so make sure code quality and structure is excellent.
4. You can (yes, it's OK) use any gem or plugin you'd like to help get the job done.
 

== Contents

This stuff already exists:

1. Models, migrations and bootstrap data for: Client, Proposal and ProposalSection
2. HTML Template: ./public/proposal-template/*
3. ProposalViewer controller with a show method

== Getting Started

1. Change directory into myapp and run <tt>rake db:create</tt> and <tt>rake db:migrate</tt>
2. Start the web server: bundle exec rails s
3. Go to http://localhost:3000/proposal_viewer/show/1 and start coding :) 

If you have any questions feel free to send me an email.



