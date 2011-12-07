#!/bin/sh

#Runs the Graphics demos in loop
if [ $# -eq 0 ]
	then 
		echo ""
		echo "Usage: RunDemo.sh [Count] [Time]"
		echo "	Count: No of iterations"
		echo "	Time : Each demo execution time in Sec" 
		exit 0
#Uncomment to use default values and comment above line 		
#		count=5
#		time=5
	else if [ $# -eq 1 ]
		then
			count=$1
			time=5
		else if [ $# -ge 2 ]
			then
				count=$1
				time=$2
			fi
		fi
	fi
	
i=1
while [ $i -le $count ]
do	
	echo ""
	echo "    Demos running: $i Round"
	echo "    1. EvilSkull"
	./OGLESEvilSkull -qat=$time > temp
	echo "    2. Particles"
	./OGLESParticles -qat=$time > temp
	echo "    3. Vase"
	./OGLESVase -qat=$time > temp
	echo "    4. Lighting"
	./OGLESLighting -qat=$time > temp
	echo "    5. UserClipPlanes"
	./OGLESUserClipPlanes -qat=$time > temp
	echo "    6. FiveSpheres"
	./OGLESFiveSpheres -qat=$time > temp
	echo "    7. PolyBump"
	./OGLESPolyBump -qat=$time > temp
	i=`expr $i + 1`
done

