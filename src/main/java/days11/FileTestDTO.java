package days11;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FileTestDTO {
	private int num;
	private String subject;
	private String filesystemname;
	private String originalfilename;
	private long filelength;
}
