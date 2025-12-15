package days06;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberInfo implements Serializable{

   private static final long serialVersionUID = -2169848001981138932L;
   private String id;
   private String name;
   private String passwd;
   private String email;
   private Date registerDate;
   
}
