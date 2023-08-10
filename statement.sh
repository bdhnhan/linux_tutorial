# shopt -s nocasematch
SET_FILE=$(ls -l | awk '$5 > 100000 {print $9 '\n'}')
if [[ -z ${SET_FILE} ]]
then
    echo Nothing file has size greater than 100KB
else
    for i in $SET_FILE
    do
        echo "----filename: $i----\\n"
        read -p "Do you want \"compress(c)\", \"remove(rm)\", \"ignore(i)\" or \"exit(e)\" this file? " THE_ANSWER
        if [ $THE_ANSWER == 'c' ]
        then
            zip ./"$i.zip" $i
            rm $i
            echo ">> compress sucessfully!"
        elif [ $THE_ANSWER == 'rm' ]
        then
            DATE=$(date +"%T - %D")
            echo "rm $i"
            echo "LOG: $DATE: $i is deleted\\n" >> del.log
        elif [ $THE_ANSWER == 'i' ]
        then
            echo ">> ignored"
        else
            echo ">> exit process..."
            break
        fi
    done
    echo "----------------------------------"
    echo ">> Process all files successfully!" 
fi