![BFH Banner](https://trello-attachments.s3.amazonaws.com/542e9c6316504d5797afbfb9/542e9c6316504d5797afbfc1/39dee8d993841943b5723510ce663233/Frame_19.png)
# one.me
one.me is a shopping application made with flutter .

* Able to signup / signin
* Able to navigate through products
* Able to cart


## Team members
1.  Sarath S [https://www.github.com/sarathsdev]
2.  Mohammed Shezin V C [https://www.github.com/shezin]
3.  Musthaq Ahammed P [https://www.github.com/i-mus]
## Team Id
BFH/recPyxILDk4oYGXo9/2021
## Link to product walkthrough
[https://drive.google.com/file/d/1AkQpdg9jEdKPOCvw2JvfpnUj81_RRhh0/view?usp=drivesdk]
## How it Works ?

Folder Structure
 ,here is the core folder structure  which flutter provides

```bash
  one.me/
  |- android
  |- build
  |- ios
  |- lib
  |- test
  
```
Here is the folder structure we have been using this project

```bash
  lib/
  |- screens/
  |- utils/
  |- main.dart
  |- ProductModel.dart
  |- generated_plugin_registrant.dart
```
Now, let's dive into the the lib folder which has the main code for the application.
```bash
1- screens - This file contains all the multiple pages of the application.
2- utils - It contains the utilities/common functions of the application.
3- main.dart - This is the starting point of application. All the application level configurations are defined here.
4- ProductModel.dart - It defines what are the items present in a product model.
5- generated_plugin_registrant.dart - It's an auto generated file while setting up firebase for authentication.
```
Project demo

![1_demo](https://user-images.githubusercontent.com/68682390/119358089-e581cb80-bcc5-11eb-9deb-66b10e144c9d.gif)

## Libraries used
```bash
firebase_core: ^1.0.4
firebase_auth: ^1.1.1
lottie: ^1.0.1
carousel_slider: ^4.0.0-nullsafety.0
```
## How to configure

Step 1. Download or clone this repo by using the link below
```bash
https://www.github.com/sarathsdev/one.me.git
```
Step 2. Go to project root and execute the following command in console to get the required dependensies:
```bash
flutter pub get
```

## How to Run
```bash
flutter run --no-sound-null-safety
```
## Application Download Link
https://drive.google.com/file/d/19k5ndB2m859HSErJ7eFxYtjDZ1sLt7tO/view?usp=drivesdk
