
package model;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author MustiU
 */
@Entity
@Table(name = "employees")
public class Employee extends BaseAdmin{
    
    @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
    private List<OrderDelivery> deliveries;
}
