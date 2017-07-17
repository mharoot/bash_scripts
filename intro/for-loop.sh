#including the bin bash folder in order to use for loops and shell features
#!/bin/bash
for i in 1 2 3 4 5
do
	echo "Welcome $i times from bash"
done

for i in {1..5}
do
	echo "Welcome $i times 3.0+.."
done

echo "Bash version ${BASH_VERSION}..."
for i in {0..10..2}
do
	echo "Welcome $i times"
done

for (( c=1; c<=5; c++ ))
do
	echo "Welcome $c times"
done

for (( ; ; ))
do
	echo "infinite loops [hit CTRL+C to stop]"
done


