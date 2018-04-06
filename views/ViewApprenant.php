<?php
$this->_t = 'TEST MVC';
foreach ($apprenants as $apprenant): ?>
<h2><?= $apprenant->title() ?></h2>
<time><?= $apprenant->date() ?></time>
<?php endforeach; ?>
