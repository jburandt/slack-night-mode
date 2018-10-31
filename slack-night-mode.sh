#!/bin/bash

function applyModification() {

  cat << 'EOF' >> "$1"
  document.addEventListener('DOMContentLoaded', function() {
   $.ajax({
     url: 'https://raw.githubusercontent.com/jburandt/slack-night-mode/master/black.css',
     success: function(css) {
       $("<style></style>").appendTo('head').html(css);
     }
   });
  });
  EOF

}

if [ -f "/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js" ]; then
  applyModification "/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js"
elif [ -f "/usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js" ]; then
  applyModification "/usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js"
fi 
echo If Slack.app is already running, refresh with CMD-R

