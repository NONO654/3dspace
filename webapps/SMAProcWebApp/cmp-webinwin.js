var editor;var init=function(){var b=(new URL(document.location)).searchParams;var a=b.get("action");switch(a){case"customadapter":require(["DS/SMAProcWebAuthoringUI/CustomAdapterList"],function(c){editor=new c();document.body.appendChild(editor)},function(c){console.error("Failed to load custom adapter list",c)});break;case"dataflow":require(["DS/SMAProcWebAuthoringUI/DataflowWebInWinEditor"],function(c){editor=new c();document.body.appendChild(editor)},function(c){console.error("Failed to load dataflow editor",c)});break;case"content":require(["DS/SMAProcWebAuthoringUI/ContentWinEditor"],function(c){editor=new c();document.body.appendChild(editor)},function(c){console.error("Failed to load content editor",c)});break;case"n2View":require(["DS/SMAProcWebAuthoringUI/nTwoViewWebInWinEditor"],function(c){editor=new c();document.body.appendChild(editor)},function(c){console.error("Failed to load n2View",c)});break;default:document.body.innerText="No action to perform!"}};var receiveMessage=function(g,f){if(editor){if(g.indexOf("404 Not Found")>-1||g.indexOf("200 OK")>-1){var e=(new DOMParser()).parseFromString(g,"text/xml");var d=e.getElementsByTagName("Message");for(var b=0;b<d.length;b++){var c=d[b];var h=c.getAttribute("jsCallback");if(h){var a=c.getElementsByTagName("Request");editor.winCallBack(h,a)}else{editor.winCallBack("Win_Response",g)}}}else{editor.winCallBack(g,f)}}};if(document.readyState==="loading"){document.addEventListener("DOMContentLoaded",init)}else{init()};