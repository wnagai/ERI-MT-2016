package labsmart.unifei.edu.br.fragexample;

import android.app.Fragment;
import android.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Toolbar myToolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(myToolbar);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        FragmentManager fragmentManager = getFragmentManager();
        Fragment fragment;

        switch (item.getItemId()) {
            case R.id.action_blank:
                fragment = new ColorsCP5();
                break;
            case R.id.action_colorfulballs:
                fragment = new ColorfulBalls();
                break;
            default:
                return super.onOptionsItemSelected(item);
        }
        fragmentManager.beginTransaction()
                .replace(R.id.container, fragment)
                .commit();

        return true;
    }
}
