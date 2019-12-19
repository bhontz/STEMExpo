**STEMExpo Swift Illustrative App**

An illustrative Swift app for mentoring a 2020 Technovation Girls challenge team.

Our team be using this app to illustrate functionality that we will ultimately incorporated into our actual team's Technovation Challenge app entry, which is NOT included within this repo.

We'll also be using this repo to learn how use Git/Github!

**Version History**

Summary of functionality through 2019-12-19:

..+ table view populated by a cloud database (Google Firebase) (i.e. illustration of table view functionality as well as a data store)

..+ search bar on the main view filters the table view (type in "orange")

..+ clicking on a table view row exposes a detailed view page with fields filled in from the appropriate Firebase record

..+ detailed view page includes a checkbox that, upon checking, updates Firebase and additionally strikesthrough the associated table view item

..+ swiping left on the detailed view page exposes a webview page, loading the associated company's website


2019-12-19: Added "left swipe" to company detail page.  Swipe left to visit the company's website.

2019-12-18: Added "strikethrough" to the tableview cell's text when the COOKIES database item (used to indicate if cookies were delivered) is set to a value of 1

2019-12-5: Integrated Firebase supporting persistence in the DetailedViewController checkbox selection.  Retained MainViewController search bar functionality. (merged into development branch)

2019-11-18: Added feature that will present a Call / Cancel dialog when a phone number (within the detailed view) is clicked on.   Created branch callphone to serve as an illustration on how to branch and merge back into the development branch.

2019-11-16:  Selectable list of STEMExpo companies, clicking on a list element displays the record details on a second scene, Cancel from that scene returns to the main scene.  Entering search bar text will filter the selectable list down to any substring of the Company field.  Search bar text that doesn't match any Company field text returns the full list.

> Written with [StackEdit](https://stackedit.io/).
