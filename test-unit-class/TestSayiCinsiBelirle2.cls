public class TestSayiCinsiBelirle2 {
    
    public static String sayiCinsi(Integer rakam) {
        
        if(rakam > 0) {
            return 'ELMA'; 
        } 
        else if (rakam < 0) {
            System.debug('Test esnasında okunmaz');
            return 'ARMUT'; 
        }
        else {
            return 'UZUM'; 
        }
    }
}