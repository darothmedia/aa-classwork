function FollowToggle(el) {
  this.userId = el.data('user-id') 
  this.followState = el.data('initial-follow-state')
  this.$el = el
}

module.exports = FollowToggle