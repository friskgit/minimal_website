---
 title: "Real-time versus non real-time"
 id: 41
 date: 2005-01-05 21:19:05.000000
 tags: writing
 category: blog
 excerpt: "I should have realized that, in starting to re-work etherSound, I would end up changing almost everything. Since the new version is multi timbral, i.e. it will play back several messages simultaneousl..."
 author_profile: false
 show_date: true
 image: 
 related: true
 layout: single
 permalink: /:categories/:year/:month/:day/:title/
---
{% unless page.image contains 'spacer.gif' %}
{% endunless %}

I should have realized that, in starting to re-work etherSound, I would end up changing almost everything. Since the new version is multi timbral, i.e. it will play back several messages simultaneously, some of the solutions I came up with for the first version will no longer work. I had two GEN23 objects in my CSound score file that read data from a text file written by the JAVA application that processed the incoming messages. It is not a big deal to put this data into additional P-fields of the score file for the non-real time version but the first solution was very elegant in its own way. Also, I would really like to have the real-time and non real-time version to be as compatible as possible when it comes to the instruments. In other words, I should make sure to think about how the real-time version can use the same instrument file to avoid having to redo it once again. Real-time / non real-time should be an option controlled in the JAVA application.

I have now a working CSound score file generation utility class in my JAVA app that seems to be working. By using the AbstractDocument model I can add notes to the score without having to write to disk everytime. It also implements the option of reading in a template from a disk file to avoid unnecessary creation of function table data within the JAVA app.


<textarea cols="80" name="text" rows="10">
public class CScoreTmpl {

    File fileName;
    StringContent tmpl;

    CScoreTmpl() {
    }

    CScoreTmpl(String fileName) {

	tmpl = new StringContent();

	try {
	    this.fileName = new File(fileName);
	}
	catch(NullPointerException npe) {
	    System.out.println("Couldn't open file\n\n"+npe.toString());
	}
    }

    public AbstractDocument.Content getTemplate() {

	StringBuffer sb = new StringBuffer();
	String line = null;

	try {
	    BufferedReader reader = new BufferedReader(new FileReader(fileName));
	    while((line=reader.readLine())!=null) {
		sb.append(line+"\n");
	    }
	    tmpl.insertString(0, sb.toString());
	}
	catch(Exception e) {
	    System.out.println("This is getTemplate\n\n"+e.toString());
	}
	return tmpl;
    }
}
</textarea>



Now, with the following calls I have a <code>PlainDocument</code> containing the necessary information and all that is added by the application are the actual note creation lines.


<textarea cols="80" name="text" rows="3">
	tmplFile = new CScoreTmpl("/path/to/template/cscore.tmpl.txt");
	tmpl = tmplFile.getTemplate();
	doc = new PlainDocument(tmpl);
</textarea>



Notes are added by creating instances of the following class (short version):


<textarea cols="80" name="text" rows="10">
public class CScoreNote {

    int fields = 0;
    Float[] pFields;

    CScoreNote(int fields) {
	this.fields = fields;
	this.pFields = new Float[fields];
    }

    CScoreNote(int fields, int instr, double start, double length) {
	this.fields = fields;
	this.pFields = new Float[this.fields];
	pFields[0] = new Float(instr);
	pFields[1] = new Float(start);
	pFields[2] = new Float(length);
    }

    public void setPField(int field, double value) {
	if(field<1 || field > fields)
	    return;
	else
	    pFields[field] = new Float(value);
    }

    public static int getInstr(CScoreNote note) {
	return note.pFields[0].intValue();
    }

    public static int getNumberOfFields(CScoreNote note) {
	return note.fields;
    }

    public int getNumberOfFields() {
	return this.fields;
    }

    public String serialize() {
	StringBuffer sb = new StringBuffer("i");

// Warning!! Error checking is not performed here.
// An empty pField throws an index out of bounds error.

	for(int i=0; i<pFields.length; i++) {
	    if(i==0)
		sb.append(pFields[i].intValue()+"\t");
	    else
		sb.append(pFields[i].toString()+"\t");
	}
	sb.append("\n");
	return sb.toString();
    }
}
</textarea>



This class allows for keeping each note with all the p-fields in an array, and saves the formatting to the call to <code>serialize</code>. There are obviously a number of ways to achive the same thing, but for what I am trying to do, this seems to be a reasonable way to achieve it.
