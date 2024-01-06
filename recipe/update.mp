has 'instructions';
has 'title';
has 'category';
has 'recipe_id';

method handle() {
	my $dbh = Ws23::DBI->dbh();

	my $title = join '', $.title;
	$title =~ s/<.+?>//g;

	$sth = $dbh->prepare("UPDATE group02_recipes SET category=?, title=?, owner_id=?, instructions=? WHERE id=?");
	$sth->execute($.category, $title, $m->session->{user_id}, $.instructions, $.recipe_id);

	$m->redirect('/wae02/index');
}
