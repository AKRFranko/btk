"use strict";
var command = require('shelly');

var posts = command('wp post list', '--format=json');

console.log(posts);
// var inquirer = require('inquirer');

// var environments = {
//   dev: {path:'/srv/http/wordpress/development', url: 'https://development.elementdebase.com'},
//   prod: {path:'srv/http/wordpress/production', url: 'https://elementdebase.com'}
// };

// var questions = {
// initial: { 
//   type: 'rawlist',
//   name: 'env',
//   message: "Select your environment?",
//   choices: [
//     "development",
//     "production"
//   ]
// },
//   main_menu: {
//     type: 'rawlist',
//     name: 'action',
//     message: 'What do you want to do?',
//     choices: [
//       "search",
//       "edit"
//     ]
//   }
// };

// var answers = {};
// var context = 'initial';

// function ask(){
//   var question;
//   if( (question = questions[context]) ){
//   inquirer.prompt( question , function( data ){
//     context="main_menu";
//     Object.keys(data).forEach(function( key ){
//       answers[key] = data[key];
//     });
//     ask();
//   });      
//   }else{
//     console.log(answers);
//   }
  
  
// }

// ask();
