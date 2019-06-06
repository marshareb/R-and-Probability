# TUTORIAL: https://www.r-bloggers.com/rselenium-a-wonderful-tool-for-web-scraping/
# TUTORIAL2: https://ropensci.org/tutorials/rselenium_tutorial/

# INSTALL THE LIBRARY
install.packages('RSelenium')

# IMPORT THE LIBRARY
library(RSelenium)

# RUN THIS INSTEAD OF checkForServer()
# (I BELIEVE YOU ONLY NEED TO RUN THIS ONCE AFTER INSTALLING, BUT NOT CONFIDENT)
rsDriver()

# START THE DRIVER
# (THIS WILL BE HOW YOU RUN THE BROWSER)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4567, browserName = "firefox")

# OPENS A COPY OF YOUR BROWSER
remDr$open()

# GIVES YOU SOME INFO ON YOUR SERVER/BROWSER SESSION
remDr$getStatus()

# SOME BASIC COMMANDS:
# NAVIGATE TO WEBSITE
remDr$navigate("https://www.google.com/")
# YOU SHOULD NOW SEE GOOGLE IN YOUR BROWSER TAB

# LET'S TRY NOW CLICKING ON THE SEARCH BAR
# FIRST WE NEED TO FIND IT

# ASSIGN ELEMENT TO A VARIABLE CALLED webElem
# TO FIND THIS, RIGHT CLICK THE SEARCHBAR IN YOUR BROWSER AND INSPECT ELEMENT
# WE SHOULD SEE AN INPUT CLASS. WE CAN USE XPATH TO FIND THIS SPECIFIC ONE
webElem <- remDr$findElement(using = 'xpath', value = "//*/input[@class='gLFyf gsfi']")
# WE CAN NOW LOOK AT THE ATTRIBUTES OF THIS ELEMENT. LET'S LOOK AT THE DIV ID
webElem$getElementAttribute("id")
# LET'S LOOK AT THE DIV CLASS
webElem$getElementAttribute("class")
# WE CAN NOW TYPE IN IT AS WELL
webElem$sendKeysToElement(list("test"))

# WE NEED TO NOW PRESS THE SEARCH BUTTON. AGAIN, RIGHT CLICK AND INSPECT ELEMENT ON THE BUTTON.
webElem <- remDr$findElement(using = 'xpath', value = "//*/input[@class='gNO89b']")
# WE NOW NEED TO CLICK IT
webElem$clickElement()
# WE NOW SEE SEARCH RESULTS!

# LET'S NOW LOOK AT THE PAGE SOURCE IN R
# THIS WILL SPIT OUT THE PAGE SOURCE IN FULL
remDr$getPageSource()[[1]]

# WE CAN NOW PARSE THIS TO MAKE IT A LITTLE MORE READABLE
# WE WILL NEED THE XML LIBRARY TO DO SO
library(XML)
htmlParse(remDr$getPageSource()[[1]])
