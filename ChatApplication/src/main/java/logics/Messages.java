package logics;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Messages {
	private int msgId;
	private String username;
	 private String message;
	 private Timestamp timestamp;
	 private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 
	 public int getMsgId() {
			return msgId;
		}
		public void setMsgId(int msgId) {
			this.msgId = msgId;
		}
	 public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	 public String getFormattedTimestamp() {
	        return sdf.format(timestamp);
	    }
	 public Messages(int msgId,String username, String message,Timestamp timestamp) {
			super();
			this.msgId=msgId;
			this.username = username;
			this.message = message;
			this.timestamp = timestamp;
		}
	
}
