!function(e){"use strict";var o=e.querySelector("#app");o.baseUrl="/";var n=new Date;o.currentMonth=n.getMonth(),o.currentDay=n.getDate(),o.currentYear=n.getFullYear(),o.renderDate=function(e,o,n){var t=new Date;return t.setDate(e),t.setMonth(o),t.setFullYear(n),t.toDateString()},o.assignColor=function(e){var o=Math.floor(360*Math.cos(parseInt(e))),n="40%",t="40%",r="hsl("+[o,n,t].join(",")+")";return r},o.drag=function(e){var n=Math.floor(6e3*Math.random());e.dataTransfer.setData("application/json",JSON.stringify({id:n,label:n,color:o.assignColor(n)}))},""===window.location.port,o.displayInstalledToast=function(){Polymer.dom(e).querySelector("platinum-sw-cache").disabled||Polymer.dom(e).querySelector("#caching-complete").show()},o.addEventListener("dom-change",function(){console.log("Our app is ready to rock!")}),window.addEventListener("WebComponentsReady",function(){console.log(o.$.xhr)}),o.handleOrdersResponse=function(e){console.log("handleOrdersResponse",e)},o.scrollPageToTop=function(){},o.closeDrawer=function(){}}(document);