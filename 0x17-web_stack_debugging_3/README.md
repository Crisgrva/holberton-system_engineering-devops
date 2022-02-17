<h1 class="gap">0x17. Web stack debugging #3</h1>
<div class="well clean" id="project-description">
  <h2>Background Context</h2>

<p><img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/293/d42WuBh.png" alt="" style="" /></p>

<p>When debugging, sometimes logs are not enough. Either because the software is breaking in a way that was not expected and the error is not being logged, or because logs are not providing enough information. In this case, you will need to go down the stack, the good news is that this is something Holberton students can do :)</p>

<p>Wordpress is a very popular tool, it allows you to run blogs, portfolios, e-commerce and company websites&hellip; It <a href="/rltoken/Ah9_LmUi191dqxT-Zx7uhg" title="actually powers 26% of the web" target="_blank">actually powers 26% of the web</a>, so there is a fair chance that you will end up working with it at some point in your career.</p>

<p>Wordpress is usually run on LAMP (Linux, Apache, MySQL, and PHP), which is a very widely used set of tools. </p>

<p>The web stack you are debugging today is a Wordpress website running on a LAMP stack.</p>

<h2>Requirements</h2>

<h3>General</h3>

<ul>
<li>All your files will be interpreted on Ubuntu 14.04 LTS</li>
<li>All your files should end with a new line</li>
<li>A <code>README.md</code> file at the root of the folder of the project is mandatory</li>
<li>Your Puppet manifests must pass <code>puppet-lint</code> version 2.1.1 without any errors</li>
<li>Your Puppet manifests must run without error</li>
<li>Your Puppet manifests first line must be a comment explaining what the Puppet manifest is about</li>
<li>Your Puppet manifests files must end with the extension <code>.pp</code> </li>
<li>Files will be checked with Puppet v3.4</li>
</ul>

<h2>More Info</h2>

<h3>Install <code>puppet-lint</code></h3>

<pre><code>$ apt-get install -y ruby
$ gem install puppet-lint -v 2.1.1
</code></pre>

</div>
