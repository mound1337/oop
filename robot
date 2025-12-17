// ===================== Main.java =====================
public class Main {

    public static void main(String[] args) {

        Robot robot = new Robot();

        robot.addSuciastka(new Head(Dequality.FIRST));
        robot.addSuciastka(new Body(Dequality.SECOND));
        robot.addSuciastka(new Arm(Dequality.FIRST));
        robot.addSuciastka(new Arm(Dequality.SECOND));
        robot.addSuciastka(new Leg(Dequality.FIRST));
        robot.addSuciastka(new Leg(Dequality.SECOND));

        DiagnoseUnit du = DiagnoseUnit.getInstance(robot.getSuciastky());

        du.diagnoseAll();
    }
}

// ===================== Dequality.java =====================
enum Dequality {
    FIRST,
    SECOND,
    THIRD,
    UNDEFINED
}

// ===================== Suciastka.java =====================
abstract class Suciastka {

    protected Dequality quality = Dequality.UNDEFINED;

    public abstract void connect();
    public abstract void disconnect();

    public void setQuality(Dequality quality) {
        this.quality = quality;
    }
}

// ===================== Diagnosable.java =====================
interface Diagnosable {
    void diagnose();
}

// ===================== Movable.java =====================
interface Movable {
    void move(int dx, int dy, int dz);
}

// ===================== Arm.java =====================
class Arm extends Suciastka implements Diagnosable, Movable {

    public Arm(Dequality quality) {
        setQuality(quality);
    }

    @Override
    public void connect() {
        System.out.println("Ruka pripojena");
    }

    @Override
    public void disconnect() {
        System.out.println("Ruka odpojena");
    }

    @Override
    public void diagnose() {
        System.out.println("Diagnostika ruky: " + quality);
    }

    @Override
    public void move(int dx, int dy, int dz) {
        System.out.println("Ruka sa pohla o [" + dx + "," + dy + "," + dz + "]");
    }
}

// ===================== Leg.java =====================
class Leg extends Suciastka implements Diagnosable, Movable {

    public Leg(Dequality quality) {
        setQuality(quality);
    }

    @Override
    public void connect() {
        System.out.println("Noha pripojena");
    }

    @Override
    public void disconnect() {
        System.out.println("Noha odpojena");
    }

    @Override
    public void diagnose() {
        System.out.println("Diagnostika nohy: " + quality);
    }

    @Override
    public void move(int dx, int dy, int dz) {
        System.out.println("Noha sa pohla o [" + dx + "," + dy + "," + dz + "]");
    }
}

// ===================== Head.java =====================
class Head extends Suciastka implements Diagnosable, Movable {

    public Head(Dequality quality) {
        setQuality(quality);
    }

    @Override
    public void connect() {
        System.out.println("Hlava pripojena");
    }

    @Override
    public void disconnect() {
        System.out.println("Hlava odpojena");
    }

    @Override
    public void diagnose() {
        System.out.println("Diagnostika hlavy: " + quality);
    }

    @Override
    public void move(int dx, int dy, int dz) {
        System.out.println("Hlava sa pohla o [" + dx + "," + dy + "," + dz + "]");
    }
}

// ===================== Body.java =====================
class Body extends Suciastka implements Diagnosable {

    public Body(Dequality quality) {
        setQuality(quality);
    }

    @Override
    public void connect() {
        System.out.println("Trup pripojeny");
    }

    @Override
    public void disconnect() {
        System.out.println("Trup odpojeny");
    }

    @Override
    public void diagnose() {
        System.out.println("Diagnostika trupu: " + quality);
    }
}

// ===================== Robot.java =====================
class Robot {

    private java.util.List<Suciastka> suciastky = new java.util.ArrayList<>();

    public void addSuciastka(Suciastka s) {
        suciastky.add(s);
    }

    public java.util.List<Suciastka> getSuciastky() {
        return suciastky;
    }
}

// ===================== DiagnoseUnit.java =====================
class DiagnoseUnit {

    private static DiagnoseUnit instance;
    private java.util.List<Suciastka> suciastky;

    private DiagnoseUnit(java.util.List<Suciastka> suciastky) {
        this.suciastky = suciastky;
    }

    public static DiagnoseUnit getInstance(java.util.List<Suciastka> suciastky) {
        if (instance == null) {
            instance = new DiagnoseUnit(suciastky);
        }
        return instance;
    }

    public void diagnoseAll() {
        for (Suciastka s : suciastky) {
            if (s instanceof Diagnosable) {
                ((Diagnosable) s).diagnose();
            }
        }
    }
}
