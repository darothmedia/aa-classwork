const FollowToggle = require("./follow_toggle.js")

require("./follow_toggle.js")

$(() => {
  const foltogs = [];
  $("button.follow-toggle").each(function (i, button) {
    foltogs.push(new FollowToggle($("button.follow-toggle").eq(i)))
    // button.append new FollowToggle()
  })
})
