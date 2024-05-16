import json
import pytz
from datetime import datetime

def generate_filename(base_name):
    return "{base_name}_{timestamp}".format(base_name=base_name,
                                            timestamp=str(datetime.now(pytz.
                                            timezone("Asia/Calcutta")).strftime('%Y_%m_%d_%H_%M'))+'.json')

def write_josn_to_file(product_list, filename):
    with open(filename, 'w') as fout:
            json.dump(product_list, fout)
    fout.close()