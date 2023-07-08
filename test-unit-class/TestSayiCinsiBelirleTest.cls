@IsTest
public class TestSayiCinsiBelirleTest {
	
    // static testMethod void sayiCinsiTest(Integer rakam){}
    
    // Pozitif, Negatif ve Sıfır için beklenen ve beklenmeyen methods yazılır. 
    
    @IsTest
    static void sayiCinsiTest() {
        
        // Pozitif sayı ile TEST -> Verilen sayı 10 Beklenen sonuc == 'ELMA'
        String sonuc = TestSayiCinsiBelirle.sayiCinsi(10);         
        
        // Pozitif test 
        System.assertEquals('ELMA', sonuc); // Beklenen
        System.assertEquals('ELMA', sonuc, 'Pozitif Method yanlış yazılmış'); 
        // ELMA yada ARMUT yerine başka bişey yazılırsa HATA MESAJI alınır. 
        // Test geçilmez. Hata LOG içerisinde görülür.   
        
        // Negatif test (BURASI YAZILMASA DA OLUR)
        System.assertNotEquals('ARMUT', sonuc); // Beklenmeyen
        System.assertNotEquals('ARMUT', sonuc, 'Negatif Method yanlış yazılmış') ;     
        
        //---------------------------------------------------------------------
        
        // Farklı Method ile yapılabilir. 
        // Negatif sayı ile TEST -> Verilen sayı -10 Beklenen sonuc == 'ARMUT'
        String sonuc2 = TestSayiCinsiBelirle.sayiCinsi(-10); 
        
        // Pozitif test 
        System.assertEquals('ARMUT', sonuc2, 'Pozitif Method yanlış yazılmış'); 
        
         // Negatif test 
        System.assertNotEquals('ELMA', sonuc2, 'Negatif Method yanlış yazılmış'); 
        // ELMA yada ARMUT yerine başka bişey yazılırsa HATA MESAJI alınır. 
        // Test geçilmez. Hata LOG içerisinde görülür.           
    }
}