has 'instructions';
has 'title';
has 'category';

method handle() {
	my $title = join '', $.title;
	$title =~ s/<.+?>//g;

	my $dbh = Ws23::DBI->dbh();
	my $sth = $dbh->prepare("INSERT INTO group02_recipes (instructions, title, category, owner_id, creation_date) VALUES (?,?,?,?,NOW())");

    $sth->execute($.instructions, $title, $.category, $m->session->{user_id});
	$m->session->{message} = sprintf("Recipe '%s' saved.", $title);
	$m->redirect('/wae02/index');
}
