has 'recipe_id' => (required => 1);

method handle() {
	my $dbh = Ws23::DBI->dbh();
	$dbh->do("DELETE FROM group02_recipes where id=?", undef, $.recipe_id);
	$m->redirect('/wae02/index');
}
