Meat-Shot version 0.1 scattergun
===========
<img src ="https://raw.githubusercontent.com/ArledgeMike/meatshot/master/images/meat-shot-cover.png" />


<h2>Meat-Shot</h2> <p>Version .1 - scattergun</p>
<p>Screenshot tool for catching layout regression in websites.</p>

<h3>Instructions</h3>
<ol>
<li>Clone Repo to your directory, open command line and CD to Meat-Shot's directory.</li>
<li>Type "ruby app.rb" to start shooting.</li>
<li>When prompted enter the URL of the site to shoot.</li>
<li>Then you will be asked to name your session.</li>
<li>The linesman will next ask you for the ranges at which to shoot at the targets. These will be widths that the app will use to test your responsive designs.</li>
<li>Next the linesman will ask you for the targets to shoot at. This will be the CSS selector for your website menu. This is how Meat-Shot builds your list of targets. Normal entries look like "nav ul li a".</li>
<li>The linesman will need to know if you will be performing any trick shots on the range. Here you will enter the location of the "test.js" file which is a JS file that will run custom JS on every page. Good for pressing buttons, or closing/opening modals.</li>
<li>A list of targets will appear. Enter the number next to the URL that you would like to omit. Just press "Enter" if everything is good.</li>
<li>When ready on the line, the linesman will pull the clay pigeons.</li>
</ol>

<h4>Dependencies</h4>
<p>gem install selenium-webdriver</p>

<h4>For the future</h4>
<p>Write some better instructions and make this a web app if possible.</p>
<p>File naming could be much better.</p>
<p>Open in tabs instead of new windows to increase speed.</p>
