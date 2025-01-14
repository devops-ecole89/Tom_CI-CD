#/bin/bash
merge_to_staging()
{
	if [ $? -eq 0 ]; then
		echo "Merge de dev dans Staging"
		git fetch --all
		git checkout staging
        	git merge dev
	        git push origin staging
	else
		echo "Tests échoués, merge annulé."
		exit 1
	fi
}

#run test on dev branch for merging to staging
run_test_dev()
{
	pytest_output=$(pytest 2>&1)
	pytest_exit_code=$?
	echo "TEST : $pytest_exit_code"
	if [ "$pytest_exit_code" -eq 0 ]; then
		echo "Tests réussis, prêt à merger dans staging"
		merge_to_staging
		return 0
	else
		echo "Tests échoués ! Erreur détectée : $TEST_RESULT"
		return 1
	fi
}

#run test on staging for merging to main
run_test_staging()
{
	pytest_output=$(pytest 2>&1)
	pytest_exit_code=$?
	echo "TEST: $pytest_exit_code"
	#Si le test renvoie 0, les tests ont réussi
	if [ "$pytest_exit_code" -eq 0]; then
		echo "Tests réussis, prêt à merge dans main"
		return 0
	else
	#Sinon on affiche l'erreur
		echo "Tests échoués!"
		return 1
	fi
}

deploy()
{
	run_test_dev
	run_test_staging
}

deploy
