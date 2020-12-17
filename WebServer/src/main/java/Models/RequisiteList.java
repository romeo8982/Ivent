package Models;

public class RequisiteList {
    private Requisite requisite;
    private Trick trick;

    public RequisiteList(Requisite requisite, Trick trick) {
        this.requisite = requisite;
        this.trick = trick;
    }

    public Requisite getRequisite() {
        return requisite;
    }

    public void setRequisite(Requisite requisite) {
        this.requisite = requisite;
    }

    public Trick getTrick() {
        return trick;
    }

    public void setTrick(Trick trick) {
        this.trick = trick;
    }
}
