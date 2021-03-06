Call App Exercise using Plivo
===

LetsDial is a rails app with Plivo Conference API to make a conference call between user provided two numbers. The followings are the key components. A click-to-call UI with 2 phone number inputs and a call button. When the call button is clicked, the two phone numbers should be joined in a call.
Basic UI:

 * Caller and Receiver input form(phone number)

* Call button

* Call drop button

The App Status
* The app is deployed in https://letsdial.herokuapp.com
* The app is failed to bridge the calls due to 'carrier gateways not found' issue.
* In order to debug the error, the calls_controller param 'to' and 'from' is currently hard-coded.
* The 'carrier gateway' is not solved during the development of 'letsdial' app and it is tested with ATT, Split and Verision and 3 numbers were all failed. The tested numbers are in the app/controllers/calls_controller.rb directory.

![alt screenshot](https://github.com/sarahkwak/call_api/blob/master/app/assets/images/letsdial-heroku.png)

In order to confirm that the this is API's failing, the python app https://sarahconfcall.herokuapp.com/response/conference was also created and tested and got the same response from the API provider.

![alt screenshot](https://github.com/sarahkwak/call_api/blob/master/app/assets/images/py-fail.png)
![alt screenshot](https://github.com/sarahkwak/call_api/blob/master/app/assets/images/sarahconfcall.png)

Side Note
===

Although it is possible to purchase phone numbers from Plivo, it was unable to purchase only numbers without subscribing the service. Thus, the app wasn't fully tested.

Note
===

1. It was a big decision to decide which app between outbound call or conference call is more appropriate to complete this challenge. The free trial from Plivo wasn't appear to be enough to create the conference call app, which turns out to be true.

2. The Ruby gem 'Plivo' was up-to-dated yet documentation wasn't the greatest. (There is also conflict function between 'plivo' and 'plivohelper' gem)

3. In order to create https://sarahconfcall.herokuapp.com/response/conference, there are many steps being involved including deploying app to heroku. Although the app was failed, it was great learning curves.

4. Still not fully understand the 'endpoint' https://manage.plivo.com/endpoint/ - their function and usage.

5. There is a place to register Incoming Carriers but there is no way to set outcoming carriers thus unable to test the app.

Next Step
===
1. Find the carrier free numbers to test the app

2. Make the form to be truly linked to the calls_controller. (It is currently hard coded in params section)

3. Call drop button to link to the call_drop API.

4. Basic UI and CSS would be nice!

If you have any questions, please feel free to contact me via sarahseyoungkwak@gmail.com