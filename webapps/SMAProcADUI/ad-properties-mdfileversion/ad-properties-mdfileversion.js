/*!  Copyright 2016 Dassault Systemes. All rights reserved. */
(function(b){var a=b.Polymer,e=b.DS;var d=null,c={commentUpdate:"commentupdate"};d=function(){if(this.model){this.fire(c.commentUpdate,{})}};e.SMAProcADUI=e.SMAProcADUI||{};e.SMAProcADUI.ADPropertiesMDFileVersion=a({is:"ad-properties-mdfileversion",properties:{model:{type:Object,value:null,observer:"modelChanged"}},modelChanged:function(){if(this.model){this.$.commentsEdit.value=this.model.details.comment;a.dom(this.$.fileSize).textContent=this.formatFileSize(this.model.size);a.dom(this.$.lastModifiedDate).textContent=this.formatDate(this.model.lastModified)}else{this.$.commentsEdit.value="";a.dom(this.$.fileSize).textContent="";a.dom(this.$.lastModifiedDate).textContent=""}},onCommentsChanged:function(){return d.apply(this,arguments)},behaviors:[e.SMAProcSP.SPBase,e.SMAProcADUI.FormatUtilities]})}(this));