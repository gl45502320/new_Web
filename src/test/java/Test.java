public class Test {
    public static void main(String[] args) {

       /* int i =1;

        i= ++i;
        i= i++;

        System.out.println(i);*/


        String s1 = "192.168.11.255";
        String s3 = "192/168/11/255";
        int i1 = s1.lastIndexOf(".");
        System.out.println(i1);
        String[] s2 = s3.split("\\/");
        System.out.println(s2.length);
        for (int i = 0; i < s2.length; i++) {
            System.out.println(s2[i]);

        }
    }
}
