package com.yxq.tools;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

public class Change {
	public static String HTMLChange(String source) {
		String changeStr = "";
		changeStr = source.replace("&", "&amp;");
		changeStr = changeStr.replace(" ", "&nbsp;");
		changeStr = changeStr.replace("<", "&lt;");
		changeStr = changeStr.replace(">", "&gt;");
		changeStr = changeStr.replace("\r\n", "<br>");

		changeStr = changeStr.replace("[F", "<font ");
		changeStr = changeStr.replace("[", "<");
		changeStr = changeStr.replace("]", ">");
		return changeStr;
	}

	public static String dateTimeChange(Date date) {
		String strDate = "";
		if (date != null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			strDate = format.format(date);
		}
		return strDate;
	}

	public static String voteContentChange(String originContent) {
		String newContent = "";
		int totalSelNum = 0;
		int totalVoteNum = 0;
		
		int beginIndex=0;
		int endIndex=0;
		ArrayList<String> voteSels = new ArrayList<String>();
		for(int i = 0;i<originContent.length();i++) {
			if(originContent.charAt(i)==';') {
				totalSelNum++;
				endIndex=i;
				voteSels.add(originContent.substring(beginIndex, endIndex)+"$0;");
				beginIndex=i+1;
			}
		}
		newContent+=totalSelNum;
		newContent+="@";
		newContent+=totalVoteNum;
		newContent+=":";
		Iterator<String> itor = voteSels.iterator();
		while(itor.hasNext()) {
			newContent+=itor.next();
		}
		return newContent;
	}
}
