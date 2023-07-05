public class FutureMethodCalismasi {
	
    @future 
    public static VOID userVeAccountRecordOlustur(string accName, String userNameEmail){
        
        //  Bu method user olusturacak
        UltilityClass.userOlustur(userNameEmail, 'Senka', 'Senka', 'senkaya20@gmail.com'); 
        
        //  Bu da account olusturacak
        UltilityClass.accountRecordOlustur(accName);
    }
}

/*
 // DEBUG
 FutureMethodCalismasi.userVeAccountRecordOlustur('CCC Deneme Acc', 'deneme@bek.le');
*/