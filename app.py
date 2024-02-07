from flask import Flask, render_template, request, redirect, url_for, session, jsonify
from flask_mysqldb import MySQL
import os
import secrets

app = Flask(__name__, template_folder='templates')

app.secret_key = os.environ.get('FLASK_SECRET_KEY', secrets.token_hex(16))

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'Guru@123'
app.config['MYSQL_DB'] = 'training_db'

mysql = MySQL(app)

@app.route('/')
def login():
    return render_template('login.html')

@app.route('/', methods=['POST'])
def login_post():
    email = request.form.get('username')
    password = request.form.get('password')
    usertype = request.form.get('usertype')

    cursor = mysql.connection.cursor()

    if usertype == 'Trainee':
        cursor.execute("SELECT * FROM trainees WHERE Trainee_Email = %s AND Password = %s", (email, password))
        trainee_data = cursor.fetchone()

        if trainee_data:
            session['trainee_name'] = trainee_data[1]
            session['usertype'] = usertype; 
            cursor.close()
            return render_template('trainee_home.html', trainee_name=session['trainee_name'])
        else:
            error_message = "Invalid email or password. Please try again."
            return render_template('login.html', error_message=error_message)
    elif usertype == 'Trainer':
        cursor.execute("SELECT * FROM trainers WHERE Email = %s AND Password = %s", (email, password))
        trainer_data = cursor.fetchone()
        if trainer_data:
            session['trainer_name'] = trainer_data[1]
            session['usertype'] = usertype;  
            cursor.close()
            return render_template('trainer_home.html', trainer_name=session['trainer_name'])
        else:
            error_message = "Invalid email or password. Please try again."
            return render_template('login.html', error_message=error_message)
    
    elif usertype == 'Company':
        cursor.execute("SELECT * FROM companies WHERE Company_Email = %s AND Password = %s", (email, password))
        company_data = cursor.fetchone()
        if company_data:
            session['company_name'] = company_data[1]
            session['usertype'] = usertype;  
            cursor.close()
            return render_template('company_home.html', company_name=session['company_name'])
        else:
            error_message = "Invalid email or password. Please try again."
            return render_template('login.html', error_message=error_message)


    cursor.close()
    return redirect(url_for('login'))


@app.route('/course_status')
def course_status():

    usertype = session.get('usertype')
    if usertype == 'Trainee':
    # Retrieve trainee_name from session
        trainee_name = session.get('trainee_name')

        # Check if trainee_name is None (not logged in)
        if not trainee_name:
            return redirect(url_for('login'))

        # Query the database for course statuses related to the logged-in trainee
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM course_statuses WHERE Trainee_Name = %s", (trainee_name,))
        course_statuses = cursor.fetchall()
        cursor.close()

        return render_template('course_status.html', trainee_name=trainee_name, course_statuses=course_statuses)
    elif usertype == 'Company':
        # Retrieve trainee_name from session
        company_name = session.get('company_name')

        # Check if trainee_name is None (not logged in)
        if not company_name:
            return redirect(url_for('login'))

        # Query the database for course statuses related to the logged-in trainee
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM course_statuses")
        course_statuses = cursor.fetchall()

        cursor.execute("select Trainee_Name from trainees")
        unique_trainee_names = cursor.fetchall()

        cursor.close()
        status_options = ["Completed","InProgress","NotStarted"]

        return render_template('course_status_company.html', company_name=company_name, course_statuses=course_statuses,status_options=status_options,unique_trainee_names=unique_trainee_names)



@app.route('/demo') #trainee
def demo():

    usertype = session.get('usertype')
    if usertype == 'Trainee':
    # Retrieve trainee_name from session
        trainee_name = session.get('trainee_name')

        # Check if trainee_name is None (not logged in)
        if not trainee_name:
            return redirect(url_for('login'))

        # Query the database for demo data related to the logged-in trainee
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM demos WHERE Trainee_Name = %s", (trainee_name,))
        demo_data_list = cursor.fetchall()
        cursor.close()

        return render_template('demo.html', trainee_name=trainee_name, demo_data_list=demo_data_list)
    elif usertype == 'Trainer':
        trainer_name = session.get('trainer_name')

        # Check if trainee_name is None (not logged in)
        if not trainer_name:
            return redirect(url_for('login'))
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM demos")
        demo_data_list = cursor.fetchall()

        cursor.execute("SELECT DISTINCT Trainee_Name FROM demos")  # Retrieve unique trainee names
        unique_trainee_names = [row[0] for row in cursor.fetchall()]
        cursor.close()
        return render_template('demo_trainer.html', trainer_name=trainer_name, demo_data_list=demo_data_list,unique_trainee_names=unique_trainee_names)

@app.route('/add_demo')
def add_demo():
    trainee_name = session.get('trainee_name')
    if not trainee_name:
        return redirect(url_for('login'))
    
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT Skill_Name FROM skills")
    skills = [row[0] for row in cursor.fetchall()]
    cursor.close()
    return render_template('add_new_demo.html',trainee_name=trainee_name,skills=skills)

@app.route('/insert_demo', methods=['POST'])
def insert_demo():
    if request.method == 'POST':
        trainee_name = session.get('trainee_name')
        if not trainee_name:
            return redirect(url_for('login'))

        Demo_Name = request.form['demo']
        Skill = request.form['skill']
        Trainee_Name = trainee_name
        new_skill = request.form['new_skill']

        if Skill == 'Other':
            Skill = new_skill

        cursor = mysql.connection.cursor()

        cursor.execute("Select Trainee_Id from trainees where Trainee_Name = %s",(Trainee_Name,))
        Trainee_Id = cursor.fetchone()[0]

        cursor.execute("INSERT INTO demos (Trainee_Id, Skill, Demo_Name,Trainee_Name) VALUES (%s, %s, %s, %s)",
                       (Trainee_Id, Skill, Demo_Name,Trainee_Name))

        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('demo'))


@app.route('/extra_works')
def extra_works():
    # Retrieve trainee_name from session
    trainee_name = session.get('trainee_name')

    # Check if trainee_name is None (not logged in)
    if not trainee_name:
        return redirect(url_for('login'))
    
    # Pagination logic
    items_per_page = 10  # Adjust as needed
    page = request.args.get('page', 1, type=int)
    start_index = (page - 1) * items_per_page
    end_index = start_index + items_per_page

    # Query the database for extra works data related to the logged-in trainee
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM extras")
    extra_works_list = cursor.fetchall()

    # Extract unique skills from the data
    unique_skills = set(extra_work[1] for extra_work in extra_works_list)

    # Query the database for extra works data related to the logged-in trainee
    cursor.execute("SELECT DISTINCT Trainee_Name FROM extras")  # Retrieve unique trainee names
    unique_trainee_names = [row[0] for row in cursor.fetchall()]

    # Paginate the data
    extra_works_to_display = extra_works_list[start_index:end_index]


    cursor.close()
    total_items = len(extra_works_list)
    total_pages = (total_items + items_per_page - 1) // items_per_page  # Calculate total pages

    return render_template('extra_works.html', trainee_name=trainee_name, extra_works_to_display=extra_works_to_display, unique_skills=unique_skills, unique_trainee_names=unique_trainee_names, total_pages=total_pages, page=page)
    


@app.route('/milestones')
def milestones():
    usertype = session.get('usertype')
    if usertype == 'Trainee':
        trainee_name = session.get('trainee_name')
        if not trainee_name:
            return redirect(url_for('login'))
        
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM milestones WHERE Trainee_Name = %s", (trainee_name,))
        milestones_data = cursor.fetchall()
        
        return render_template('milestones.html', milestones_data=milestones_data,trainee_name=trainee_name)
    elif usertype == 'Trainer':
        trainer_name = session.get('trainer_name')
        if not trainer_name:
            return redirect(url_for('login'))
        
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM milestones")
        milestones_data = cursor.fetchall()

        cursor.execute("SELECT DISTINCT Trainee_Name FROM milestones")  # Retrieve unique trainee names
        unique_trainee_names = [row[0] for row in cursor.fetchall()]
        
        return render_template('milestone_trainer.html', milestones_data=milestones_data,trainer_name=trainer_name,unique_trainee_names=unique_trainee_names)
    
    elif usertype == 'Company':
        company_name = session.get('company_name')
        if not company_name:
            return redirect(url_for('login'))
        
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM milestones")
        milestones_data = cursor.fetchall()

        cursor.execute("SELECT DISTINCT Trainee_Name FROM milestones")  # Retrieve unique trainee names
        unique_trainee_names = [row[0] for row in cursor.fetchall()]
        
        return render_template('milestone_company.html', milestones_data=milestones_data,company_name=company_name,unique_trainee_names=unique_trainee_names)
    
@app.route('/projects')
def projects():
    usertype = session.get('usertype')
    if usertype == 'Trainee':
        trainee_name = session.get('trainee_name')
        if not trainee_name:
            return redirect(url_for('login'))
        
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM projects WHERE Trainee_Name = %s", (trainee_name,))
        projects_data = cursor.fetchall()
        
        return render_template('projects.html', projects_data=projects_data,trainee_name=trainee_name)
    elif usertype == 'Trainer':
        trainer_name = session.get('trainer_name')
        if not trainer_name:
            return redirect(url_for('login'))
        
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM projects")
        projects_data = cursor.fetchall()
        
        return render_template('projects_trainer.html', projects_data=projects_data,trainer_name=trainer_name)

@app.route('/add_project')
def add_project():
    trainee_name = session.get('trainee_name')
    if not trainee_name:
        return redirect(url_for('login'))
    
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT Skill_Name FROM skills")
    skills = [row[0] for row in cursor.fetchall()]
    cursor.close()
    return render_template('add_new_project.html',trainee_name=trainee_name,skills=skills)

@app.route('/insert_project', methods=['POST'])
def insert_project():
    if request.method == 'POST':
        trainee_name = session.get('trainee_name')
        if not trainee_name:
            return redirect(url_for('login'))

        Demo_Name = request.form['project']
        Skill = request.form['skill']
        Trainee_Name = trainee_name
        new_skill = request.form['new_skill']

        if Skill == 'Other':
            Skill = new_skill

        cursor = mysql.connection.cursor()

        cursor.execute("Select Trainee_Id from trainees where Trainee_Name = %s",(Trainee_Name,))
        Trainee_Id = cursor.fetchone()[0]

        cursor.execute("INSERT INTO projects (Trainee_Id, Skill, Project_Name,Trainee_Name) VALUES (%s, %s, %s, %s)",
                       (Trainee_Id, Skill, Demo_Name,Trainee_Name))

        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('projects'))  


@app.route('/add_extra_task')
def add_extra_task():
    trainee_name = session.get('trainee_name')
    if not trainee_name:
        return redirect(url_for('login'))
    
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT distinct skill FROM trainer_tasks")
    skills = [row[0] for row in cursor.fetchall()]
    cursor.close()
    return render_template('add_extra_task.html',trainee_name=trainee_name,skills=skills)

@app.route('/insert_extra_task', methods=['POST'])
def insert_extra_task():
    if request.method == 'POST':
        trainee_name = session.get('trainee_name')
        if not trainee_name:
            return redirect(url_for('login'))

        task_name = request.form['task_name']
        skill = request.form['skill']
        sub_skill = request.form['sub_skill']
        solution = request.form['solution']
        no_of_hours = request.form['no_of_hours']
        new_skill = request.form['new_skill']
        trainee_name = trainee_name

        if skill == 'Other':
            skill = new_skill

        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO extras (Extra_Task, Skill, Sub_Skill, Solution, Trainee_Name,Number_Of_Hours) VALUES (%s, %s, %s, %s, %s, %s)",
                       (task_name, skill, sub_skill, solution, trainee_name,no_of_hours))

        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('extra_works'))
    

@app.route('/task_status')
def task_status():

    usertype = session.get('usertype')

    if usertype == 'Trainee':
        trainee_name = session.get('trainee_name')
        if not trainee_name:
            return redirect(url_for('login'))

        # Assuming you have a 'tasks' table with columns 'Task_Name' and 'Status'
        items_per_page = 20  # Adjust as needed
        page = request.args.get('page', 1, type=int)
        start_index = (page - 1) * items_per_page
        end_index = start_index + items_per_page

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM traineecheck WHERE Trainee_Name = %s order by Task_Date desc",(trainee_name,))
        tasks = cursor.fetchall()
        cursor.close()

        tasks_to_show = tasks[start_index:end_index]

        total_items = len(tasks)
        total_pages = (total_items + items_per_page - 1) // items_per_page
        return render_template('task_status.html', tasks_to_show=tasks_to_show,total_pages=total_pages, page=page)
    elif usertype == 'Trainer':
        trainer_name = session.get('trainer_name')
        if not trainer_name:
            return redirect(url_for('login'))

        # Assuming you have a 'tasks' table with columns 'Task_Name' and 'Status'

        items_per_page = 23  # Adjust as needed
        page = request.args.get('page', 1, type=int)
        start_index = (page - 1) * items_per_page
        end_index = start_index + items_per_page

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM traineecheck order by Task_Date desc")
        tasks = cursor.fetchall()
        cursor.close()
        tasks_to_show = tasks[start_index:end_index]

        total_items = len(tasks)
        total_pages = (total_items + items_per_page - 1) // items_per_page
        return render_template('task_status_trainer.html', tasks_to_show=tasks_to_show,total_pages=total_pages, page=page)


@app.route('/edit_task_status/<string:task_name>')
def edit_task_status(task_name):
    if 'trainee_name' in session:
        trainee_name = session['trainee_name']

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM traineecheck WHERE Trainee_Name = %s AND Task_Name = %s", (trainee_name, task_name))
        task = cursor.fetchone()
        cursor.close()

        return render_template('edit_task_status.html', task=task)
    else:
        # Handle the case when the trainee is not logged in
        return redirect(url_for('login'))
    
@app.route('/update_task_status/<string:task_name>', methods=['POST'])
def update_task_status(task_name):
    if 'trainee_name' in session:
        Trainee_Name = session['trainee_name']
        new_status = request.form.get('new_status')
        feedback = request.form.get('feedback')
        cursor = mysql.connection.cursor()
        cursor.execute("UPDATE traineecheck SET Task_Status = %s, Feedback = %s WHERE Trainee_Name = %s and Task_Name = %s", (new_status,feedback, Trainee_Name, task_name,))
        mysql.connection.commit()
        cursor.close()

    return redirect(url_for('task_status'))



@app.route('/home_page')
def home_page():
    usertype = session.get('usertype')
    if usertype == 'Trainee':
        trainee_name = session.get('trainee_name')
        return render_template('trainee_home.html', trainee_name=trainee_name)
    elif usertype == 'Trainer':
        trainer_name = session.get('trainer_name')
        return render_template('trainer_home.html', trainer_name=trainer_name)
    elif usertype == 'Company':
        company_name = session.get('company_name')
        return render_template('company_home.html', company_name=company_name)




@app.route('/add_task') #trainer
def add_task():
    trainer_name = session.get('trainer_name')
    # Fetch skills from the database (replace 'your_query' with the actual query).
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT distinct skill FROM trainer_tasks")
    skills = [row[0] for row in cursor.fetchall()]
    cursor.close()

    # Pass the skills to the template.
    return render_template('add_task.html', skills=skills,trainer_name=trainer_name)

@app.route('/insert_task', methods=['POST']) #trainer
def insert_task():
    if request.method == 'POST':
        Trainer_Name = session.get('trainer_name')
        Trainer_Task_Name = request.form['task_name']
        Date_Of_Task = request.form['date']
        Skill = request.form['skill']
        new_skill = request.form['new_skill']
        Sub_skill = request.form['sub_skill']
        Type_Of_Task = request.form['task_type']
        
        
        cursor = mysql.connection.cursor()

        cursor.execute("SELECT Trainer_Id FROM trainers WHERE Name = %s",(Trainer_Name,))
        Trainer_Id = cursor.fetchone()

        if Skill == 'Other':
            Skill = new_skill

        # Insert the task details into the 'tasks' table (replace 'your_query' with the actual query).
        cursor.execute("INSERT INTO trainer_tasks (Trainer_Name,Trainer_Task_Name,Date_Of_Task,Skill,Sub_skill,Trainer_Id,Type_Of_Task) VALUES (%s, %s, %s, %s, %s, %s, %s)", (Trainer_Name,Trainer_Task_Name,Date_Of_Task,Skill,Sub_skill,Trainer_Id,Type_Of_Task))
        mysql.connection.commit()


        # Insert data into the 'xyz' table multiple times with different names.
        cursor.execute("SELECT Trainee_Id, Trainee_Name FROM trainees")
        values = cursor.fetchall()

        Task_Status = 'Not Done'
        Feedback = 'All Good'

        # Insert data into the 'xyz' table multiple times with different names and ids.
        for data in values:
            cursor.execute("INSERT INTO traineecheck (Task_name, Task_Date, Task_Status,Feedback,Trainee_Id,Trainee_Name) VALUES (%s, %s, %s, %s, %s, %s)",
                           (Trainer_Task_Name,Date_Of_Task,Task_Status,Feedback, data[0], data[1]))
            mysql.connection.commit()

        cursor.close()

        return redirect(url_for('add_task'))  # Redirect to a success page or another route
    else:
        return redirect(url_for('add_task'))
    

@app.route('/feedbacks_by_trainer')
def feedbacks_by_trainer():
    trainer_name = session.get('trainer_name')
    if not trainer_name:
        return redirect(url_for('login'))
    
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM feedbacks")
    feedbacks_data = cursor.fetchall()

    cursor.execute("SELECT distinct Trainee_Name from feedbacks")
    trainee_names = [row[0] for row in cursor.fetchall()]

    cursor.close()
    return render_template('feedbacks_trainer.html', feedbacks_data=feedbacks_data,trainee_names=trainee_names,trainer_name=trainer_name)

@app.route('/add_new_feedback')
def add_new_feedback():
    usertype = session.get('usertype')
    if usertype == 'Trainer':
        trainer_name = session.get('trainer_name')
        if not trainer_name:
            return redirect(url_for('login'))
        
        cursor = mysql.connection.cursor()

        cursor.execute("Select distinct Trainee_Name from trainees")
        trainee_names = [row[0] for row in cursor.fetchall()]
        return render_template('add_feedbacks_trainer.html',trainer_name=trainer_name,trainee_names=trainee_names)
    elif usertype == 'Trainee':
        trainee_name = session.get('trainee_name')
        if not trainee_name:
            return redirect(url_for('login'))
        
        cursor = mysql.connection.cursor()

        cursor.execute("Select Name from trainers")
        trainer_names = [row[0] for row in cursor.fetchall()]
        return render_template('add_feedback_trainee.html',trainee_name=trainee_name,trainer_names=trainer_names)

@app.route('/insert_new_feedback',methods=['POST'])
def insert_new_feedback():
    usertype = session.get('usertype')
    if usertype == 'Trainer':
        if request.method == 'POST':
            trainer_name = session.get('trainer_name')
            if not trainer_name:
                return redirect(url_for('login'))

            Trainee_Name = request.form['trainee_name']
            Week = 'week'+ str(request.form['week'])
            Feedback = request.form['feedback']
            Ratings = request.form['rating']

            cursor = mysql.connection.cursor()

            cursor.execute("Select Trainer_Id from trainers where Name = %s",(trainer_name,))
            Trainer_Id = cursor.fetchone()[0]

            cursor.execute("Select Trainee_Id from trainees where Trainee_Name = %s",(Trainee_Name,))
            Trainee_Id = cursor.fetchone()[0]

            cursor.execute("INSERT INTO feedbacks (Trainee_Id, Trainer_Id, Trainer_Name, Trainee_Name, Feedback,Ratings,Week) VALUES (%s, %s, %s, %s, %s, %s,%s)",
                        (Trainee_Id, Trainer_Id, trainer_name, Trainee_Name, Feedback,Ratings,Week))

            mysql.connection.commit()
            cursor.close()

            return redirect(url_for('feedbacks_by_trainer'))
    elif usertype == 'Trainee':
        if request.method == 'POST':
            Trainee_Name = session.get('trainee_name')
            if not Trainee_Name:
                return redirect(url_for('login'))

            Trainer_Name = request.form['trainer_name']
            Feedback_For_Trainer = request.form['feedback']
            Rating_For_Trainer = request.form['rating']

            cursor = mysql.connection.cursor()

            cursor.execute("Select Trainer_Id from trainers where Name = %s",(Trainer_Name,))
            Trainer_Id = cursor.fetchone()[0]

            cursor.execute("Select Trainee_Id from trainees where Trainee_Name = %s",(Trainee_Name,))
            Trainee_Id = cursor.fetchone()[0]

            cursor.execute("INSERT INTO trainer_feedbacks (Trainee_Id, Trainer_Id, Trainer_Name, Trainee_Name, Feedback_For_Trainer,Rating_For_Trainer) VALUES (%s, %s, %s, %s, %s, %s)",
                        (Trainee_Id, Trainer_Id, Trainer_Name, Trainee_Name, Feedback_For_Trainer,Rating_For_Trainer))

            mysql.connection.commit()
            cursor.close()

            return redirect(url_for('feedbacks_by_trainee'))   
    
    
@app.route('/feedbacks_by_trainee')
def feedbacks_by_trainee():

    usertype = session.get('usertype')
    if usertype == 'Trainee':
        trainee_name = session.get('trainee_name')
        if not trainee_name:
            return redirect(url_for('login'))
        
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM trainer_feedbacks where Trainee_Name = %s",(trainee_name,))
        my_feedbacks = cursor.fetchall()

        cursor.close()
        return render_template('feedbacks_trainee.html', my_feedbacks=my_feedbacks,trainee_name=trainee_name)
    elif usertype == 'Company':
        company_name = session.get('company_name')
        if not company_name:
            return redirect(url_for('login'))
        
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM trainer_feedbacks")
        feedbacks = cursor.fetchall()

        cursor.close()
        return render_template('feedback_trainer_company.html', feedbacks=feedbacks,company_name=company_name)

    
@app.route('/edit_feedback/<string:trainer_name>')
def edit_feedback(trainer_name):
    if 'trainee_name' in session:
        trainee_name = session['trainee_name']

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM trainer_feedbacks WHERE Trainee_Name = %s AND Trainer_Name = %s", (trainee_name, trainer_name))
        feedbacks = cursor.fetchone()
        cursor.close()

        return render_template('edit_feedback_trainee.html', feedbacks=feedbacks)
    else:
        # Handle the case when the trainee is not logged in
        return redirect(url_for('login'))
    
@app.route('/update_feedback/<string:trainer_name>', methods=['POST'])
def update_feedback(trainer_name):
    if 'trainee_name' in session:
        Trainee_Name = session['trainee_name']
        Feedback = request.form.get('new_feedback')
        rating = request.form.get('new_rating')
        cursor = mysql.connection.cursor()

        #cursor.execute("Select Trainee_Id from trainees where Trainee_Name = %s",(Trainee_Name,))
        #Trainee_Id = cursor.fetchone()[0]

        cursor.execute("UPDATE trainer_feedbacks SET Feedback_For_Trainer = %s, Rating_For_Trainer = %s WHERE Trainer_Name = %s and Trainee_Name = %s", (Feedback,rating,trainer_name,Trainee_Name,))
        mysql.connection.commit()
        cursor.close()

    return redirect(url_for('feedbacks_by_trainee'))

@app.route('/trainers_list')
def trainers_list():
    company_name = session.get('company_name')
    if not company_name:
        return redirect(url_for('login'))
    
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM trainers")
    trainers_data = cursor.fetchall()
    
    return render_template('trainers_list.html', trainers_data=trainers_data,company_name=company_name)



@app.route('/add_trainer') 
def add_trainer():
    company_name = session.get('company_name')
    if not company_name:
        return redirect(url_for('login'))
    # Pass the skills to the template.
    return render_template('add_trainer.html',company_name=company_name)


@app.route('/insert_trainer',methods=['POST'])
def insert_trainer():
    if request.method == 'POST':
        company_name = session.get('company_name')
        if not company_name:
            return redirect(url_for('login'))

        Name = request.form['trainer_name']
        Email = request.form['email']
        Experience_Years = request.form['exp']
        Password = request.form['password']
        

        cursor = mysql.connection.cursor()

        cursor.execute("INSERT INTO trainers (Name, Email, Experience_Years,Password) VALUES (%s, %s, %s,%s)",
                       (Name, Email, Experience_Years,Password))

        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('trainers_list'))
    

@app.route('/traineees_list')
def trainees_list():
    company_name = session.get('company_name')
    if not company_name:
        return redirect(url_for('login'))
    
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM trainees")
    trainees_data = cursor.fetchall()
    
    return render_template('trainees_list.html', trainees_data=trainees_data,company_name=company_name)
    
@app.route('/add_trainee') 
def add_trainee():
    company_name = session.get('company_name')
    if not company_name:
        return redirect(url_for('login'))
    # Pass the skills to the template.
    return render_template('add_trainee.html',company_name=company_name)


@app.route('/insert_trainee',methods=['POST'])
def insert_trainee():
    if request.method == 'POST':
        company_name = session.get('company_name')
        if not company_name:
            return redirect(url_for('login'))

        Trainee_Name = request.form['Trainee_name']
        Trainee_Email = request.form['email']
        Client_Name = request.form['client']
        Password = request.form['password']
        Joining_Date = request.form['joining_date']
        

        cursor = mysql.connection.cursor()

        cursor.execute("INSERT INTO trainees (Trainee_Name, Trainee_Email, Client_Name,Password,Joining_Date) VALUES (%s, %s, %s,%s,%s)",
                       (Trainee_Name, Trainee_Email, Client_Name,Password,Joining_Date))

        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('trainees_list'))


@app.route('/skills_list')
def skills_list():
    company_name = session.get('company_name')
    if not company_name:
        return redirect(url_for('login'))
    
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM Skills")
    skills_data = cursor.fetchall()
    
    return render_template('skills_list.html',skills_data=skills_data,company_name=company_name)

@app.route('/add_skills') 
def add_skills():
    company_name = session.get('company_name')
    if not company_name:
        return redirect(url_for('login'))
    # Pass the skills to the template.
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT Name from trainers")
    trainer_list = [row[0] for row in cursor.fetchall()]

    cursor.execute("SELECT Client_Name from clients")
    client_list = [row[0] for row in cursor.fetchall()]
    cursor.close()
    return render_template('add_skills.html',company_name=company_name,trainer_list=trainer_list,client_list=client_list)

@app.route('/insert_skills',methods=['POST']) 
def insert_skills():
    if request.method == 'POST':
        company_name = session.get('company_name')
        if not company_name:
            return redirect(url_for('login'))

        Skill_Name = request.form['skill_name']
        Client_Name = request.form['client']
        Trainer_Name = request.form['trainer']
        

        cursor = mysql.connection.cursor()
        cursor.execute('select Trainer_Id from trainers where Name = %s',(Trainer_Name,))
        Trainer_Id = cursor.fetchone()[0]

        cursor = mysql.connection.cursor()
        cursor.execute('select Client_Id from clients where Client_Name = %s',(Client_Name,))
        Client_Id = cursor.fetchone()[0]

        cursor.execute("INSERT INTO skills (Skill_Name, Client_Name, Trainer_Name,Client_Id,Trainer_Id) VALUES (%s, %s, %s,%s,%s)",
                       (Skill_Name, Client_Name, Trainer_Name,Client_Id,Trainer_Id))

        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('skills_list'))


@app.route('/add_results') 
def add_results():
    company_name = session.get('company_name')
    if not company_name:
        return redirect(url_for('login'))
    # Pass the skills to the template.
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT Trainee_Name from trainees")
    trainee_list = [row[0] for row in cursor.fetchall()]

    return render_template('add_results.html',company_name=company_name,trainee_list=trainee_list)


@app.route('/insert_results',methods=['POST']) 
def insert_results():
    if request.method == 'POST':
        company_name = session.get('company_name')
        if not company_name:
            return redirect(url_for('login'))

        Trainee_Name = request.form['trainee_name']
        Milestone_Name = "Milestone Assessment - " + str(request.form['milestone_name'])
        Marks = request.form['marks']
        

        cursor = mysql.connection.cursor()
        cursor.execute('select Trainee_Id from trainees where Trainee_Name = %s',(Trainee_Name,))
        Trainee_Id = cursor.fetchone()[0]

        cursor.execute("INSERT INTO milestones (Milestone_Name, Trainee_Name, Trainee_Id,Marks) VALUES (%s, %s, %s,%s)",
                       (Milestone_Name, Trainee_Name, Trainee_Id,Marks))

        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('milestones'))
    

@app.route('/add_course') 
def add_course():
    company_name = session.get('company_name')
    if not company_name:
        return redirect(url_for('login'))
    # Pass the skills to the template

    return render_template('add_course.html',company_name=company_name)



@app.route('/insert_course',methods=["POST"]) 
def insert_course():
    company_name = session.get('company_name')
    if not company_name:
        return redirect(url_for('login'))
    # Pass the skills to the template.

    Proficiency = request.form['prof']
    Duration = request.form['duration']
    Status = 'NotStarted'
    Remarks = request.form['remarks']
    Learning_Path_Name = request.form['learning_path']
    Course_Name = request.form['course']

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT Trainee_Id,Trainee_Name,Trainee_Email from trainees")
    trainee_list = cursor.fetchall()
    for data in trainee_list:
        cursor.execute("INSERT INTO course_statuses (Trainee_Id, Trainee_Name,Trainee_Email,Proficiency,Duration,Status,Remarks,Learning_Path_Name,Course_Name) VALUES (%s, %s, %s, %s, %s, %s,%s,%s,%s)",
                        (data[0], data[1],data[2],Proficiency,Duration,Status,Remarks,Learning_Path_Name,Course_Name))
        mysql.connection.commit()
    cursor.close()

    return redirect(url_for('course_status'))

@app.route('/update_course_status', methods=['POST'])
def update_course_status():
    if request.method == 'POST':
        company_name = session.get('company_name')
        if not company_name:
            return redirect(url_for('login'))
            # Get data from the form
        Trainee_Name = request.form.get('name')
        Status = request.form.get('status')

        cursor = mysql.connection.cursor()

        # Replace 'your_table_name' with the actual table name
        update_query = "UPDATE course_statuses SET Status = %s WHERE Trainee_Name = %s"
        cursor.execute(update_query, (Status, Trainee_Name))

        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('course_status')) 
    
    
@app.route('/trainee_details/<string:trainee_name>')
def trainee_details(trainee_name):
    company_name = session.get('company_name')
    if not company_name:
        return redirect(url_for('login')) 
    cursor = mysql.connection.cursor()
    cursor.execute("Select * from trainees where Trainee_Name = %s",(trainee_name,))
    trainees_data = cursor.fetchall()
    cursor.close()
    return render_template('trainee_details.html',company_name=company_name,trainees_data=trainees_data)


@app.route('/update_trainee', methods=['POST'])
def update_trainee():
    if request.method == 'POST':
        company_name = session.get('company_name')
        if not company_name:
            return redirect(url_for('login'))
            # Get data from the form
        Trainee_Name = request.form.get('name')
        AWS_Credits = request.form.get('aws_cr')
        Azure_Credits = request.form.get('azure_cr')
        IIHT_Score = request.form.get('score')
        Assignments_Submitted = request.form.get('assignment')

        cursor = mysql.connection.cursor()

        # Replace 'your_table_name' with the actual table name
        update_query = "UPDATE trainees SET AWS_Credits = %s,Azure_Credits = %s,IIHT_Score = %s,Assignments_Submitted = %s WHERE Trainee_Name = %s"
        cursor.execute(update_query, (AWS_Credits,Azure_Credits,IIHT_Score,Assignments_Submitted,Trainee_Name))

        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('trainees_list'))
    
@app.route('/view_profile')
def view_profile():
    usertype = session.get('usertype')
    if usertype == 'Trainee':
        Trainee_Name = session.get('Trainee_Name')
        if not Trainee_Name:
            return redirect(url_for('login'))
        cursor = mysql.connection.cursor()
        cursor.execute("select Trainee_Email,Password from trainees where Trainee_Name = %s",(Trainee_Name,))
        trainee_data = cursor.fetchone()
        cursor.close()
        return render_template('profile.html',trainee_data=trainee_data,usertype=usertype)
    elif usertype == 'Trainer':
        Trainer_Name = session.get('Trainer_Name')
        if not Trainer_Name:
            return redirect(url_for('login'))
        cursor = mysql.connection.cursor()
        cursor.execute("select Email,Password from trainers where Name = %s",(Trainer_Name,))
        trainer_data = cursor.fetchone()
        cursor.close()
        return render_template('profile.html',trainer_data=trainer_data,usertype=usertype)
    elif usertype == 'Company':
        Company_Name = session.get('company_name')
        if not Company_Name:
            return redirect(url_for('login'))
        cursor = mysql.connection.cursor()
        cursor.execute("select Company_Email,Password from companies where Company_Name = %s",(Company_Name,))
        comp_data = cursor.fetchone()
        cursor.close()
        return render_template('profile.html',comp_data=comp_data,usertype=usertype)




@app.route('/success')
def success():
    return "Login successful!"

@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    response = redirect(url_for('login'))
    
    # Add Cache-Control headers to prevent caching
    response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '0'
    
    return response


@app.route('/data_from_flask')
def get_data():
    # Retrieve data from your backend (replace with actual data)
    labels = ['A', 'B', 'C', 'D', 'E']
    values = [10, 20, 30, 40, 50]

    # Return the data as JSON
    return jsonify(labels=labels, values=values)


@app.route('/show')
def show():
    return render_template('testing_charts.html')

if __name__ == '__main__':
    app.run(debug=True)
