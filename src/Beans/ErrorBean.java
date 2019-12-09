package Beans;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class ErrorBean implements Serializable {
    public ErrorBean() {
    }
    private Set<String> errors = new HashSet<>();

    public Set<String> getErrors() {
        return errors;
    }

    public void setErrors(Set<String> errors) {
        this.errors = errors;
    }
    public void addError(String error){
        errors.add(error);
    }
    public void cleanErrors(){
        errors.clear();
    }
}
