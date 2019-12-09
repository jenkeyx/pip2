package Beans;

public class Dot {
    private double x;
    private double y;
    private double r;
    private boolean inZone;

    public Dot(double x, double y, double r, boolean inZone) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.inZone = inZone;
    }
    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }

    public boolean isInZone() {
        return inZone;
    }

    public void setInZone(boolean inZone) {
        this.inZone = inZone;
    }

    @Override
    public String toString() {
        return "Dot{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                ", inZone=" + inZone +
                '}';
    }
}
