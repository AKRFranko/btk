/*
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/

(function(document) {
  'use strict';

  // Grab a reference to our auto-binding template
  // and give it some initial binding values
  // Learn more about auto-binding templates at http://goo.gl/Dx1u2g
  var app = document.querySelector('#app');
  
  // Sets app default base URL
  app.baseUrl = '/';
  
  var now = new Date();
  
  app.currentMonth = now.getMonth();
  app.currentDay = now.getDate();
  app.currentYear = now.getFullYear();
  app.renderDate = function( day, month, year ){
    var d= new Date();
    d.setDate(day);
    d.setMonth(month);
    d.setFullYear(year);
    return d.toDateString();
  }
  
  app.assignColor = function( id ){
    var h = Math.floor(Math.cos(parseInt(id))*360);
    var s = '40%';
    var l = '40%';
    var color ='hsl('+[h,s,l].join(',')+')';
    return color;
    
  },
  app.drag = function drag(ev) {
    var id = Math.floor(Math.random() * 6000 );
      ev.dataTransfer.setData("application/json", JSON.stringify({ id: id, label: id, color: app.assignColor( id ) }));
  }
      
                 
  if (window.location.port === '') {  // if production
    // Uncomment app.baseURL below and
    // set app.baseURL to '/your-pathname/' if running from folder in production
    // app.baseUrl = '/polymer-starter-kit/';
  }

  app.displayInstalledToast = function() {
    // Check to make sure caching is actually enabled—it won't be in the dev environment.
    if (!Polymer.dom(document).querySelector('platinum-sw-cache').disabled) {
      Polymer.dom(document).querySelector('#caching-complete').show();
    }
  };

  // Listen for template bound event to know when bindings
  // have resolved and content has been stamped to the page
  app.addEventListener('dom-change', function() {
    console.log('Our app is ready to rock!');
    
  });
  
  // See https://github.com/Polymer/polymer/issues/1381
  window.addEventListener('WebComponentsReady', function() {
    // imports are loaded and elements have been registered
    console.log(app.$.xhr)
  });
  
  app.handleOrdersResponse = function( event ){
    console.log('handleOrdersResponse',event)
  }
  
  
  

  // Main area's paper-scroll-header-panel custom condensing transformation of
  // the appName in the middle-container and the bottom title in the bottom-container.
  // The appName is moved to top and shrunk on condensing. The bottom sub title
  // is shrunk to nothing on condensing.
  // window.addEventListener('paper-header-transform', function(e) {
  //   var appName = Polymer.dom(document).querySelector('#mainToolbar .app-name');
  //   var middleContainer = Polymer.dom(document).querySelector('#mainToolbar .middle-container');
  //   var bottomContainer = Polymer.dom(document).querySelector('#mainToolbar .bottom-container');
  //   var detail = e.detail;
  //   var heightDiff = detail.height - detail.condensedHeight;
  //   var yRatio = Math.min(1, detail.y / heightDiff);
  //   // appName max size when condensed. The smaller the number the smaller the condensed size.
  //   var maxMiddleScale = 0.50;
  //   var auxHeight = heightDiff - detail.y;
  //   var auxScale = heightDiff / (1 - maxMiddleScale);
  //   var scaleMiddle = Math.max(maxMiddleScale, auxHeight / auxScale + maxMiddleScale);
  //   var scaleBottom = 1 - yRatio;

  //   // Move/translate middleContainer
  //   Polymer.Base.transform('translate3d(0,' + yRatio * 100 + '%,0)', middleContainer);

  //   // Scale bottomContainer and bottom sub title to nothing and back
  //   Polymer.Base.transform('scale(' + scaleBottom + ') translateZ(0)', bottomContainer);

  //   // Scale middleContainer appName
  //   Polymer.Base.transform('scale(' + scaleMiddle + ') translateZ(0)', appName);
  // });

  // Scroll page to top and expand header
  app.scrollPageToTop = function() {
    // app.$.headerPanelMain.scrollToTop(true);
  };

  app.closeDrawer = function() {
   // app.$.paperDrawerPanel.closeDrawer();
  };

})(document);
