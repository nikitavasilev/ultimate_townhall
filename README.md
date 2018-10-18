# Scrapping18-10


## Intro
### Contributors: 
Arthur Mansuy, Nathaniel Debache, Ysaline Macé,  Nikita Vasilev


This programm was built for the third week for THP, this is the first group-programm and kind of complex program. Arthur Mansuy worked about twitter, follow the townhall's handles with the gem twitter, Nathaniel Debache's job was about send mail to all the townhall with the gmail gem. Ysaline Macé and Thomas Charvet worked about scrapping some name, email of alle the townhall of 3 different french department (Alpes Maritimes,Ile de la réunion and Var), once the scrapping is good, it was necessary to stock the data in an .json file then push the data on a gooledrive worksheet whith the google_drive gem. So in fact,this programm is scrapping some mails from the web, stock them, send them and follow the twitter account.
First you have to download this repo, when you are inside run bundle install.


##  Leaf files  
## What is the purpose of each file ???

The app.rb file is the main programm of the repo. It is link with all the other programm, and call the class. The Gemfile coutains all the gem required and necessary. The db directory coutains all the stocked datla (mail, API-key config, cresidential flows).
All the programm are in the lib repo. In app we have the scrapper who scrapp mail, the mailer who send mail, the follower who follow handle on twitter. In wiew repo you have 2 programms done and index necessary to the app.rb, one to say ok it's done the other to choose what the user want to do




## What is the program do ???

First the programm is scrapping some name and some emails of a lot of french townhalls.Then it save it on a jsonfile.Then it send these data on a googleworksheet.  And other programm take all of thes emails and send a mail with the gem gmail.  The last programm follow all the twitter account who have the same name of the townhall






