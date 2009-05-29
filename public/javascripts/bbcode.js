/*
 * Javascript for inserting BBcode
 *
 */
 
var BBcode = {
 
  // insert text
  insert: function(f, text) {
    /* Source: http://www.alexking.org/blog/2003/06/02 */
    f = $(f);
 
    if (document.selection) {
      // ie
      f.focus();
      var sel = document.selection.createRange();
      sel.text = text;
    } else if (f.selectionStart || f.selectionStart == '0') {
       // mozilla
       var startPos = f.selectionStart;
       var endPos = f.selectionEnd;
       f.value = f.value.substring(0, startPos) + text + f.value.substring(endPos, f.value.length);
    } else {
       f.value += text;
    }
    f.focus();
  },
 
  // insert tag
  tag: function(t,f) {
    var f = $(f);
    var start_tag = "[" + t + "]";
    var end_tag = "[\/" + t + "]";
 
    if (document.selection) {
      // ie
      f.focus();
      var selected = document.selection.createRange().text;
      var sel = document.selection.createRange();
      sel.text = start_tag + selected + end_tag;
    } else if (f.selectionStart || f.selectionStart == '0') {
      // mozilla
      var startPos = f.selectionStart;
      var endPos = f.selectionEnd;
      var text = start_tag + f.value.substring( startPos, endPos ) + end_tag;
      f.value = f.value.substring(0, startPos) + text + f.value.substring(endPos, f.value.length);
    } else {
      f.value += start_tag + end_tag;
    }
    f.focus();
  },
 
  // insert a url
  url: function(f) {
    var url = prompt("Please enter the url", "http://");
    if (url) {
      var text = "[url=" + url + "]" + "Link" + "[\/url]";
      BBcode.insert(f, text);
    }
  },
 
  // insert an image
  image: function(f) {
    var url = prompt("Please enter the image url", "http://");
    if (url) {
      var text = "[img]" + url + "[\/img]";
      BBcode.insert(f, text);
    }
  },
 
  // insert a youtube video
  yvideo: function(f) {
    var url = prompt("Please enter the youtube video url", "http://");
    if (url) {
      var text = "[youtube]" + url + "[\/youtube]";
      BBcode.insert(f, text);
    }
  },
 
  // insert a google video
  gvideo: function(f) {
    var url = prompt("Please enter the google video url", "http://");
    if (url) {
      var text = "[gvideo]" + url + "[\/gvideo]";
      BBcode.insert(f, text);
    }
  }
}