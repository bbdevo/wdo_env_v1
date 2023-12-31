/**
 * @File Name          : Utils_Random.cls
 * @Description        :
 * @Author             : butters@salesforce.com
 * @Last Modified On   : 6/23/2020, 9:42:41 AM
 * @Modification Log   :
**/
public without sharing class Utils_Random {

    //method to return random value between 2 numbers
    public static Integer generateRandomFromRange(integer startNum, integer endNum){
        Integer returnValue;
        //Logic- first we will generate random boolean value which will decide if we want to
        //add the random number from startNum or will subtract random number from endNum
        Integer randomNumber = Integer.valueof((math.random() * 10));
        boolean addSubFlag= math.mod(randomNumber,2) == 0 ? true : false;

        integer diffInRange = endNum-startNum;
        //Now find random number staring from 0 to diffInRange
        Integer randomNum = Math.mod(Math.round(Math.random()*diffInRange+1),diffInRange);

        //If addSubFlag is true, we will add random number generated between 0 and diffInRange from start number
        //else we will subtract random number from end number
        if(addSubFlag){
            if(diffInRange > 1)
                returnValue =startNum + randomNum;
            else
                returnValue =startNum;
        }else{
            if(diffInRange > 1)
                returnValue = endNum - randomNum;
            else
                returnValue =endNum;
        }
        return returnValue;
    }

    //method to return random number between 0 and size-1
    public static Integer generateRandomNumber(Integer size){
        Decimal d = math.random() * size;
        return d.intValue();
    }

    //method to return boolean number randomly
    public static Boolean generateRandomBoolean(){
        integer randomNumber = Integer.valueof((math.random() * 10));
        boolean returnValue= math.mod(randomNumber,2) == 0 ? true : false;
        return returnValue;
    }
    //Finding a random string value from list of strings
    public static String findRandomStringFromList(List<String> values){
        Integer randomNumber = generateRandomFromRange(0,values.size()-1);
        return values[randomNumber];
    }

    public static Time GetElapsedTime(Time startTime, Time endTime) {

        if(startTime == null || endTime == null)
            return Time.newInstance(0, 0, 0, 0);

        Integer elapsedHours = endTime.hour() - startTime.hour();
        Integer elapsedMinutes = endTime.minute() - startTime.minute();
        Integer elapsedSeconds = endTime.second() - startTime.second();
        Integer elapsedMiliseconds = endTime.millisecond() - startTime.millisecond();

        return Time.newInstance(elapsedHours, elapsedMinutes, elapsedSeconds, elapsedMiliseconds);
    }

} // class