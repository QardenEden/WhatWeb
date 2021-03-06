##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2
# remove :name & :certainty, updated description
##
Plugin.define "Moodle" do
author "Andrew Horton"
version "0.2"
description "Opensource educational software written in PHP. - Homepage: http://www.moodle.org/"

# In earlier versions of Moodle, the version number was sometimes available (depending upon the theme used) by hovering over the Moodle logo on the front page. This functionality was removed in Moodle 1.9.7 onwards for security reasons.

# ShodanHQ results as at 2012-03-02 #
# 11,952 for MoodleSession
# 10,431 for MoodleSessionTest
#  8,529 for MOODLEID_

# Google results as at 2012-3-02 #
# 191 for inurl:"login/index.php?MoodleSession"

# Dorks #
dorks [
'inurl:"login/index.php?MoodleSession"'
]

# Examples #
examples %w|
203.148.13.24
74.53.177.107
194.47.199.103
65.18.36.118
81.98.166.78
148.233.77.229
83.246.141.56
66.242.127.33
88.255.170.59
|

# Matches #
matches [

# Link Title
{ :regexp=>/<a title="Moodle[^"]+" href="http:\/\/moodle\.org\/">/ },

# Link Title # Version Detection
{ :version=>/<a title="Moodle ([\d\.]+[^"]+)" href="http:\/\/moodle\.org\/">/ },

# Logo HTML
{ :name=>"moodle logo.gif", :certainty=>75, :regexp=>/<img style="width:100px;height:30px" src="[^"]+\/moodlelogo\.gif" alt="moodlelogo" \/>/ },

# Set-Cookie # MoodleSession
{ :name=>"MoodleSession Cookie", :search=>"headers[set-cookie]", :regexp=>/MoodleSession=/ },

# Set-Cookie # MOODLEID_*
{ :name=>"MOODLEID_ Cookie", :search=>"headers[set-cookie]", :regexp=>/MOODLEID_[^\s^=]*=/ },

]

end

