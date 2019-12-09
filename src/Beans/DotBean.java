package Beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class DotBean implements Serializable {
    private List<Dot> array = new ArrayList<>();

    public DotBean() {
    }

    public List<Dot> getArray() {
        return array;
    }

    public void setArray(List<Dot> array) {
        this.array = array;
    }

    public void addValue (double x, double y, double r, boolean inZone){
        array.add(new Dot(x,y,r,inZone));
    }
}
