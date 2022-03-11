function test()

notest=2;
grade=zeros(1,notest);

epsilon=0.001;

printf('--- Checker ---\n')

for i =1:notest

	testint=strcat('graf', num2str(i));
	printf('\n--- Ruleaza %d pe fisierul \"%s\"\n', i, testint);
	unlink(strcat(testint, '.out'));
	PageRank(testint, 0.85, epsilon);

	fid_out = fopen(strcat(testint, '.out'), 'r');
	fid_ref = fopen(strcat(testint, '.ref'), 'r');

	out = fscanf(fid_out, "%lf");
	ref = fscanf(fid_ref, "%lf");

	fclose(fid_out);
	fclose(fid_ref);

	n_out = uint8(out(1));
	n_ref = uint8(ref(1));

	if n_out ~= n_ref
		grade(i) = grade(i) + 0;
		printf('    %-12s %3d p (output: %d, expected: %d)\n',
				'Length', 0, n_out, n_ref);
	else

		test1=0;
		for x=1:n_out
			if abs(out(1 + x) - ref(1 + x)) > epsilon
				test1=x;
				break;
			endif
		endfor

		if test1 == 0
			grade(i) = grade(i) + 40;
			printf('    %-12s %3d p\n', 'Iterative', 40);
		else
			grade(i) = grade(i) + 0;
			printf('    %-12s %3d p (diferenta la index %d)\n', 'Iterative', 0, test1);
		endif

		test2=0;
		for x=1:n_out
			if abs(out(1 + x + n_out) - ref(1 + x + n_out)) > epsilon
				test2=x;
				break;
			endif
		endfor

		if test2 == 0
			grade(i) = grade(i) + 40;
			printf('    %-12s %3d p\n', 'Algebraic', 40);
		else
			grade(i) = grade(i) + 0;
			printf('    %-12s %3d p (diferenta la index %d)\n',
					'Algebraic', 0, test2);
		endif

		testfin=0;
		for x=1:3:n_out * 3
			i1_out = int32(out(1 + 2 * n_out + x));
			i2_out = int32(out(1 + 2 * n_out + x + 1));
			i3_out = out(1 + 2 * n_out + x + 2);

			i1_ref = int32(ref(1 + 2 * n_ref + x));
			i2_ref = int32(ref(1 + 2 * n_ref + x + 1));
			i3_ref = ref(1 + 2 * n_ref + x + 2);

			if i1_out ~= i1_ref || i2_out ~= i2_ref || abs(i3_out - i3_ref) > epsilon
				testfin=x;
				break;
			endif
		endfor

		if testfin == 0
			grade(i) = grade(i) + 20;
			printf('    %-12s %3d p\n', 'GradApartenenta', 20);
		else
			grade(i) = grade(i) + 0;
			printf('    %-12s %3d p (diferenta la index %d)\n', 'GradApartenenta', 0, testfin);
		endif
	endif
	printf('\n    %-12s %3d p\n', 'Final', grade(i));
endfor

printf('\n--- Punctaj: %d p ---\n', sum(grade) / notest);